#import "RestConverter.h"
#import <Python/Python.h>

NSData* renderRest(NSURL* url) {
	
	PyObject *pmodule, *pmethod, *presult;
	PyTupleObject *pmethodargs;
	PyDictObject *pmethodnamedargs;
	char* output;
	NSString *source = [NSString stringWithContentsOfFile:[url path] encoding:NSUTF8StringEncoding error:nil];
	
	Py_Initialize();
	
	// TODO: there's no exception handling going on here at all.
	// TODO: Is it possible to make the warnings go away?
	
	pmethodargs = PyTuple_New(1);
	pmethodnamedargs = PyDict_New();
	
	PyTuple_SetItem(pmethodargs, 0, PyString_FromString([source UTF8String]));
	PyDict_SetItemString(pmethodnamedargs, "writer_name", PyString_FromString("html"));
	pmodule = PyImport_ImportModule("docutils.core");
	pmethod = PyObject_GetAttrString(pmodule, "publish_string");
	presult = PyObject_Call(pmethod, pmethodargs, pmethodnamedargs);	
	if (PyErr_Occurred())
		PyErr_Print();
	PyArg_Parse(presult, "s", &output);
	if (PyErr_Occurred())
		PyErr_Print();
	
	Py_Finalize();
		
	NSString *html = [NSString stringWithUTF8String:output];
	return [html dataUsingEncoding:NSUTF8StringEncoding];
}