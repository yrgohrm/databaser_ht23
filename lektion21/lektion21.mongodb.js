use("testdb")

// db.testcoll.find({ name: /^Nisse/ })
// db.testcoll.find({ name: /^Nisse/ })


let cur = db.testcoll.find({ age: { $gt: 18 }})
while (cur.hasNext()) {
    let doc = cur.next()
    if (doc.age < 42) {
        console.log("Vilken ungdom!")
    }

    console.log(doc.age)
    console.log(doc.name)
    console.log(doc._id)
}

let res = db.testcoll.insertOne({ name: "Bosse Bengtsson"})
console.log(res)

db.testcoll.insertOne({ name: "Irma Bengtsson", parent: res.insertedId })
