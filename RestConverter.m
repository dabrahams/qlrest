#import "RestConverter.h"
#import <Python/Python.h>

NSData* renderRest(NSString* source) {
	// Renders the contents of a NSURL from rest source into HTML.
	// Requires that Python and docutils be installed.
	// Returns NULL for any kind of failure.
	
	PyTupleObject *pmethodargs;
	PyDictObject *pmethodnamedargs;
	PyObject *psource, *pwriter, *pmodule, *pmethod, *presult;
	
	char* output;
	
	Py_Initialize();
	
	// TODO: there's no exception handling going on here at all.
	// TODO: Is it possible to make the warnings go away?
	
	pmethodargs = PyTuple_New(1);
	if (pmethodargs == NULL) return NULL;
	pmethodnamedargs = PyDict_New();
	if (pmethodnamedargs == NULL) return NULL;
	
	psource = PyString_FromString([source UTF8String]);
	if (psource == NULL) return NULL;
	PyTuple_SetItem(pmethodargs, 0, psource);
	
	pwriter = PyString_FromString("html");
	if (pwriter == NULL) return NULL;
	PyDict_SetItemString(pmethodnamedargs, "writer_name", pwriter);
	pmodule = PyImport_ImportModule("docutils.core");
	//if (PyErr_Occurred())
	//	PyErr_Print();
	if (pmodule == NULL) return NULL;
	
	pmethod = PyObject_GetAttrString(pmodule, "publish_string");
	//if (PyErr_Occurred())
	//	PyErr_Print();
	if (pmethod == NULL) return NULL;
	
	presult = PyObject_Call(pmethod, pmethodargs, pmethodnamedargs);	
	//if (PyErr_Occurred())
	//	PyErr_Print();
	if (presult == NULL) return NULL;
	
	PyArg_Parse(presult, "s", &output);
	//if (PyErr_Occurred())
	//	PyErr_Print();
	
	
	Py_DECREF(presult);
	Py_DECREF(pmethod);
	Py_DECREF(pmodule);
	Py_DECREF(pwriter);
	Py_DECREF(psource);
	Py_DECREF(pmethodnamedargs);
	Py_DECREF(pmethodargs);
	
	NSString *html = [NSString stringWithUTF8String:output];
	
	// TODO: Why does this cause segfault?
	//Py_Finalize();
		
	return [html dataUsingEncoding:NSUTF8StringEncoding];
}