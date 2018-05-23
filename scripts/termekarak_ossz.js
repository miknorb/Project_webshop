function osszTermekAr() {
    sql("SELECT name AS \"Terméknév\", price AS \"Egységár (db)\", amount*price AS \"Készlet értéke (Ft)\" " +
        "FROM `product`")
}