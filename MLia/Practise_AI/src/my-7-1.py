#!/usr/bin/env python
#-*- coding: utf-8 -*-


import numpy as np
b = 0
a = 0.5
x = np.array([[b,1,1],[b,1,0],[b,0,0],[b,0,1]])
d = np.array([1,1,0,1])
w = np.array([b,0,0])
def sgn(v):
	if v > 0:
		return 1
	else:
		return 0
def comy(myw,myx):
	print "np.dot(myw.T,myx):"+str(np.dot(myw.T,myx))
	print "sgn              :"+str(sgn(np.dot(myw.T,myx)))
	return sgn(np.dot(myw.T,myx))
def neww(oldw,myd,myx,a):
	print "oldw		  :"+str(w)
	print "a*(myd-comy(oldw,myx)):"+str(a*(myd-comy(oldw,myx)))
	return oldw+a*(myd-comy(oldw,myx))*myx
i = 0
for xn in x:
	print "before neww:"+str(w)
	w = neww(w,d[i],xn,a)
	print "after  neww:"+str(w)
	print 
	i+=1



for xn in x:
	print "%d and %d => %d"%(xn[1],xn[2],comy(w,xn))

