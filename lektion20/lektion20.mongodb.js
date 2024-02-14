use("testdb")

// db.employees.insertMany([
//     { name: "Losse Bredsladd", age: 52, salary: 43500 },
//     { name: "Nena Lamm", age: 48, salary: 63500, ceo: true },
//     { name: "Beyla Iskandar", age: 45, salary: 55000 },
//     { name: "Gisse Hult", age: 30, salary: 45000 },
// ])


db.employees.find({ name: "Lena Lamm"})
db.employees.find({ age: 30, name: "Nisse Hult" })
db.employees.find({ salary: { $gt: 45000 }})