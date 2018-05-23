function pestiUsers() {
    sql("SELECT customers.id, customers.name, customers.user_address " +
        "FROM customers JOIN city ON customers.cityid = city.id " +
        "WHERE city.name LIKE 'Budapest'");
}