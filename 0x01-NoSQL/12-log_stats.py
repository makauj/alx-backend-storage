#!/usr/bin/env python3
"""Log status of a given file."""


from pymongo import MongoClient


if __name__ == "__main__":
    """
    script that provides some stats about Nginx logs stored in MongoDB
    - total number of logs
    - number of methods (GET, POST, PUT, PATCH, DELETE)
    - number of status check (GET /status)
    """
    client = MongoClient()
    collection = client.logs.nginx

    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")

    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    print('Methods:')
    for method in methods:
        method_count = collection.count_documents({"method": method})
        print(f"{method}: {method_count}")

    status_count = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{status_count} status check")
