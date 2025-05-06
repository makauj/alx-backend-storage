#!/usr/bin/env python3
"""TOP STUDENTS"""


def top_students(mongo_collection):
    """returns all students sorted by average score"""
    pipeline = [
        {
            "$group": {
                "_id": "$student_id",
                "averageScore": {"$avg": "$score"}
            }
        },
        {
            "$sort": {
                "averageScore": -1
            }
        }
    ]
    return list(mongo_collection.aggregate(pipeline))
