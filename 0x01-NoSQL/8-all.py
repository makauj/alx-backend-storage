#!/usr/bin/env python3
"""all"""


def list_all(mongo_collection):
    """lists all documents in a collection"""
    if mongo_collection is None:
        return []
    return (mongo_collection.find())
