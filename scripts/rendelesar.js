function rendelesar() {
    sql("SELECT SUM(amount * price) " +
        "FROM `orders`")
}