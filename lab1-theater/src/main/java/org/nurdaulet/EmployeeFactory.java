package org.nurdaulet;

class EmployeeFactory {
    public static Employee createEmployee(String type, String name, int age, String contactInfo, double salary, String roleOrPosition) {
        switch (type.toLowerCase()) {
            case "actor":
                return new Actor(name, age, contactInfo, salary, roleOrPosition);
            case "director":
                return new Director(name, age, contactInfo, salary, roleOrPosition);
            case "technician":
                return new Technician(name, age, contactInfo, salary, roleOrPosition);
            default:
                return null;
        }
    }
}
