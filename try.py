# -*- coding: utf-8 -*-
"""
Created on Sun May 24 09:33:11 2020

@author: HP ProBook
"""
from temp import power_k_means
#import matplotlib.pyplot as plt

from sklearn.datasets.samples_generator import make_blobs
X, y_true, centers = make_blobs(n_samples=300, centers=5,
                       cluster_std=0.60, random_state=0,n_features = 5,return_centers = True)

from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=5)
kmeans.fit(X)

print(centers)
km_centers = kmeans.cluster_centers_
print(km_centers)

print(power_k_means(X,-1,5,20))