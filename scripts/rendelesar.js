function rendelesar() {
    SQL("SELECT SUM(amount * price) " +
        "FROM `orders`")
}