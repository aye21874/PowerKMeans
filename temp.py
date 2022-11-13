# -*- coding: utf-8 -*-
"""
implementation of Power K means

"""
import numpy as np
def compute_w_mat(data, centroids, s):
    n = data.shape[0]
    k = centroids.shape[0]
    weights = np.zeros((n,k))
    for i in range(n):
        curr = np.tile(data[i,:],(k,1))
        diff = centroids - curr
        norm = np.sum(diff**2,axis = 1)
        denom = np.sum(norm**s,axis = 0)/k
        denom = denom**(1-1/s)
        weights[i,:] = ((norm**(s-1))/(k*denom)).T
    return weights

def compute_centers(w_mat,data):
    k = w_mat.shape[1]
    m,n = data.shape
    centroids = np.zeros((k,n))
    for j in range(k):
        denom = np.sum(w_mat[:,j])
        num = np.sum(np.multiply(data,(w_mat[:,j])[:,np.newaxis]),axis = 0)
        centroids[j,:] = num / denom
    return centroids

def init_centroids(r,k,n):
    centroids = r*np.random.rand(k,n);
    return centroids
    
def power_k_means(data,s,k,max_iteration):
    m,n = data.shape
    centroids = init_centroids(1,k,n)
    
    for i in range(max_iteration):
        w_mat = compute_w_mat(data,centroids,s)
        centroids = compute_centers(w_mat,data)
    
    return centroids        

