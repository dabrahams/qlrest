#import "RestConverter.h"
#import <Python/Python.h>

NSData* renderRest(NSString* source) {
	// Renders the contents of a NSURL from rest source into HTML.
	// Requires that Python, docutils and pygments be installed.

    NSString *html = NULL;

	Py_Initialize();

    PyObject *pSettingsDict;
    pSettingsDict = PyDict_New();
    PyDict_SetItemString(pSettingsDict, "file_insertion_enabled", Py_False);
    PyDict_SetItemString(pSettingsDict, "raw_enabled", Py_False);
    PyDict_SetItemString(pSettingsDict, "strip_comments", Py_True);
    PyDict_SetItemString(pSettingsDict, "doctitle_xform", Py_False);
    PyDict_SetItemString(pSettingsDict, "report_level", PyInt_FromLong(5));
    PyDict_SetItemString(pSettingsDict, "syntax_highlight", PyString_FromString("short"));
    PyDict_SetItemString(pSettingsDict, "math_output", PyString_FromString("latex"));

    PyObject *pDocutilsCoreModule;
    pDocutilsCoreModule = PyImport_ImportModule("docutils.core");

    PyObject *pPublishMethod;
    pPublishMethod = PyObject_GetAttrString(pDocutilsCoreModule, "publish_parts");

    PyObject *pPublishArgs;
    pPublishArgs = PyTuple_New(1);
    PyTuple_SetItem(pPublishArgs, 0, PyString_FromString([source UTF8String]));

    PyObject *pPublishKwargs;
    pPublishKwargs = PyDict_New();
    PyDict_SetItemString(pPublishKwargs, "writer_name", PyString_FromString("html"));
    PyDict_SetItemString(pPublishKwargs, "settings_overrides", pSettingsDict);

    PyObject *pParts;
    pParts = PyObject_Call(pPublishMethod, pPublishArgs, pPublishKwargs);

    Py_DECREF(pSettingsDict);
    Py_DECREF(pDocutilsCoreModule);
    Py_DECREF(pPublishMethod);
    Py_DECREF(pPublishArgs);
    Py_DECREF(pPublishKwargs);

    if (pParts == NULL && PyErr_Occurred()) {
        PyObject *pErrType, *pErrValue, *pTraceback;
        PyErr_Fetch(&pErrType, &pErrValue, &pTraceback);

        if (pErrValue != NULL)
            html = [NSString stringWithFormat:@
                    "<html>"
                    "<body>"
                    "<h2>Error Parsing reStructuredText</h2>"
                    "<hr/>"
                    "<pre>"
                    "%@"
                    "</pre>"
                    "<h2>Source</h2>"
                    "<hr/>"
                    "<pre>"
                    "%@"
                    "</pre>"
                    "</body>"
                    "</html>",
                    [NSString stringWithUTF8String:PyString_AsString(PyObject_Str(pErrValue))],
                    source];

        Py_XDECREF(pErrType);
        Py_XDECREF(pErrValue);
        Py_XDECREF(pTraceback);

        if (html != NULL)
            return [html dataUsingEncoding:NSUTF8StringEncoding];
    }

    PyObject *pBody;
    pBody = PyDict_GetItemString(pParts, "html_body");

    if (pBody != NULL) {
        char *body = PyString_AsString(PyUnicode_AsUTF8String(pBody));
        Py_DECREF(pBody);

        NSString *styles = [NSString stringWithContentsOfFile:[[NSBundle bundleWithIdentifier: @"net.pixane.qlgenerator.QLRest"]
                                                               pathForResource:@"styles" ofType:@"css"]
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];

        html = [NSString stringWithFormat:@
                "<html>"
                "<head>"
                "<meta content=\"text/html; charset=UTF-8\" http-equiv=\"Content-Type\" />"
                "<style type=\"text/css\">"
                "%@"
                "article { background-color:white; padding:20px; }"
                "</style>"
                "</head>"
                "<body>"
                "<div class=\"announce instapaper_body rst\" data-path=\"/\" id=\"readme\">"
                "<article class=\"markdown-body entry-content\" itemprop=\"mainContentOfPage\">"
                "%@"
                "</article>"
                "</div>"
                "</body>"
                "</html>",
                styles, [NSString stringWithUTF8String:body]];

        return [html dataUsingEncoding:NSUTF8StringEncoding];
    }

    return NULL;
}
