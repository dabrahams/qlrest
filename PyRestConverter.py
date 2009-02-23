#
#  PyRestConverter.py
#  QLRest
#
#  Created by Idan Gazit on 20/2/09.
#  Copyright (c) 2009 __MyCompanyName__. All rights reserved.
#

from Foundation import *
import objc
from docutils.core import publish_string

NSObject = objc.lookUpClass(u"NSObject")
class PyRestConverter(NSObject):
	def __init__(self):
		self = super(PyRestConverter, self).init()
		return self
	
    def restToHtml_(self, rest):
		return publish_string(rest, writer_name='html')
	#restToHtml = objc.accessor(restToHtml)
	
	def foo_(self):
		return u'foo!'

