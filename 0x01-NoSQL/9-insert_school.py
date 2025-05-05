#!/usr/bin/env python3
"""insert school"""


def insert_school(mongo_collection, **kwargs):
    """Insert a new document in a collection based on kwargs"""
    result = mongo_collection.insert(kwargs)
    return result
