QLRest
======

Introduction
------------

QLRest is a simple QuickLook generator for `ReStructuredText`_ files. It renders a preview of the selected ReST file using `python`_ and `docutils`_.

For more information on ReStructuredText see http://docutils.sourceforge.net/rst.html.

.. _ReStructuredText: http://docutils.sourceforge.net/rst.html
.. _python: http://www.python.org
.. _docutils: http://docutils.sourceforge.net


Installation
------------

Simply copy QLRest.qlgenerator to ~/Library/QuickLook or /Library/QuickLook.

QLRest requires that docutils be installed and on the PYTHONPATH of your default python installation. If docutils cannot be found, or if another error arises during the rendering process, qlrest will fall back to plain-text previews.

To uninstall, drag QLRest.qlgenerator into the trash.


Source Code
-----------

Source code is available at http://github.com/idangazit/qlrest.


License
-------

The QLRest code is distributed under the terms in the file `LICENSE.txt`.

QLRest is "based on" (read: largely copied from) `QLMarkdown`_ by Phil Toland <http://fiatdev.com> and Michael Dominic K. <http://www.mdk.org.pl>.

.. _QLMarkdown: http://github.com/toland/qlmarkdown/

Version History
---------------

Version 1.0 - Feb 23rd 2009

* Initial release. **"Alpha Quality" -- use at your own risk!**