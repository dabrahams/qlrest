QLRest
=============================================================================


Introduction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

QLRest is a simple QuickLook generator for `reStructuredText`_ files. It
renders a preview of the selected ReST file using `Python`_, `Docutils`_ and
`Pygments`_.

If you work on reST (reStructuredText) documents, you might find it frustrating
to manually convert them to HTML, PDF or some other format just to see what
they'll look like. QuickLook on the Mac provides a way to avoid this
frustration.

This software has a `lineage`_. Highlights of which are:

1. Phillip Toland (`toland`_) originally created the `qlmarkdown`_ project to
   provide a QuickLook plugin for Markdown files.

2. Idan Gazit (`idan`_) adapted `qlmarkdown`_ to his *qlrest* project to
   provide the same capability for reStructureText files.

3. Dave Abrahams (`dabrahams`_) forked Idan's *qlrest* project to make it work
   in new versions of OSX.

4. I forked Dave's *qlrest* project to add nicer styling and code block syntax
   highlighting to provide a view nearly identical to how GitHub renders
   reStructuredText files.

.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _Python: http://www.python.org/
.. _Docutils: http://docutils.sourceforge.net/
.. _Pygments: http://pygments.org/
.. _lineage: https://github.com/cluther/qlrest/network/members
.. _toland: https://github.com/toland
.. _qlmarkdown: https://github.com/toland/qlmarkdown
.. _idan: https://github.com/idan
.. _dabrahams: https://github.com/dabrahams


Screenshots
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

What do the QuickLook previews look like?

Valid reStructuredText with syntax highlighting on a ``.. code:: python`` block.

.. image:: https://lh6.googleusercontent.com/rcaqpqHR8gueABZA3P_dwdNkb1rppobhlbZc-9tzDOe9kKPSgDyQx-dqt1V3Rg9uUDfe2JvT2RI

Invalid reStructuredText.

.. image:: https://lh3.googleusercontent.com/All_lvK2rbpAzC6TO42aoUsWcQ_95Ur7JIPdMgZ1Bbm_1AkWUvEyVs6rGVGmOWQSv3BZWI5ahFU


Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Install Python package dependencies.

   QLRest requires that docutils and pygments be installed and on the
   PYTHONPATH of your default python installation. If docutils and pygments
   cannot be found, or if another error arises during the rendering process,
   qlrest will fall back to plain-text previews.

   .. code:: bash

      pip install -U docutils
      pip install -U pygments

2. Copy `QLRest.qlgenerator`_ to ~/Library/QuickLook or /Library/QuickLook.

3. Reload QuickLook. This probably isn't necessary.

   .. code:: bash

      qlmanage -r


To uninstall, drag QLRest.qlgenerator into the trash.

.. _QLRest.qlgenerator: https://github.com/downloads/cluther/qlrest/QLRest.qlgenerator.zip


Source Code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Source code is available at http://github.com/cluther/qlrest.


License
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The QLRest code is distributed under the terms in the file `LICENSE.txt`. See
notes on lineage of authorship in the introduction second of this README.


Change Log
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Version 2.0.0 - Aug 10th 2012
-----------------------------------------------------------------------------

* Added GitHub reST styling including Pygments syntax highlighting support.

Version 0.1 - Feb 23rd 2009
-----------------------------------------------------------------------------

* Initial release. **"Alpha Quality" -- use at your own risk!**
