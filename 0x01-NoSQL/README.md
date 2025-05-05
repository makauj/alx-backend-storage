# NoSQL

### 1. **What NoSQL Means**

* **NoSQL** stands for “Not Only SQL.” It refers to a class of databases that don't use the traditional relational model (tables and rows) of SQL databases.
* It’s designed to handle **large volumes of unstructured or semi-structured data**, scale horizontally, and support flexible data models.

---

### 2. **Difference Between SQL and NoSQL**

| Feature          | SQL (Relational DB)          | NoSQL (Non-Relational DB)          |
| ---------------- | ---------------------------- | ---------------------------------- |
| **Data Model**   | Tables with rows and columns | Document, Key-Value, Column, Graph |
| **Schema**       | Fixed, predefined schema     | Dynamic, flexible schema           |
| **Scalability**  | Vertical (scale-up)          | Horizontal (scale-out)             |
| **Transactions** | Strong ACID support          | Varies (some support full ACID)    |
| **Examples**     | MySQL, PostgreSQL, Oracle    | MongoDB, Cassandra, Redis, Neo4j   |

---

### 3. **What is ACID**

ACID is a set of properties that ensure database transactions are reliable:

* **A**tomicity – All operations succeed or none do.
* **C**onsistency – The database moves from one valid state to another.
* **I**solation – Transactions don’t interfere with each other.
* **D**urability – Once committed, the data stays even if there’s a crash.

NoSQL databases sometimes sacrifice full ACID for **availability and scalability** (see: **CAP theorem**).

---

### 4. **What is Document Storage**

* A **document database** stores data in **documents** (typically JSON, BSON, or XML).
* Each document is a self-contained unit with nested fields and arrays.
* **MongoDB** is the most popular document-oriented NoSQL database.

Example (MongoDB document):

```json
{
  "name": "Alice",
  "email": "alice@example.com",
  "orders": [
    { "item": "Book", "quantity": 2 },
    { "item": "Pen", "quantity": 5 }
  ]
}
```

---

### 5. **What Are NoSQL Types**

There are four main types of NoSQL databases:

1. **Document** (e.g., MongoDB) – JSON-like documents.
2. **Key-Value** (e.g., Redis) – Simple key-to-value mapping.
3. **Column-family** (e.g., Cassandra) – Columns grouped into families.
4. **Graph** (e.g., Neo4j) – Nodes and edges representing relationships.

---

### 6. **Benefits of NoSQL Databases**

* **Scalability** – Designed to scale out across many servers.
* **Flexibility** – No rigid schema; easy to store complex data.
* **High performance** – Optimized for specific use cases.
* **Better for Big Data** – Ideal for real-time web apps, IoT, etc.

---

### 7. **How to Query Information from a NoSQL Database (e.g., MongoDB)**

Using MongoDB:

```js
// Find all users named Alice
db.users.find({ name: "Alice" });

// Find users older than 25
db.users.find({ age: { $gt: 25 } });
```

MongoDB uses a **query language based on JSON**-like syntax.

---

### 8. **How to Insert/Update/Delete Information from a NoSQL Database**

MongoDB example:

**Insert:**

```js
db.users.insertOne({ name: "Bob", age: 30 });
```

**Update:**

```js
db.users.updateOne(
  { name: "Bob" },
  { $set: { age: 31 } }
);
```

**Delete:**

```js
db.users.deleteOne({ name: "Bob" });
```

---

### 9. **How to Use MongoDB**

**Steps to use MongoDB:**

1. **Install MongoDB** (from [mongodb.com](https://www.mongodb.com/try/download/community))
2. **Start MongoDB Server** (usually with `mongod`)
3. **Connect using Mongo Shell** (`mongosh`) or use GUI like **MongoDB Compass**
4. **Basic Commands:**

   * `show dbs` – List databases
   * `use myDatabase` – Switch/create database
   * `db.createCollection("myCollection")` – Create collection
   * `db.myCollection.insertOne({...})` – Insert document
