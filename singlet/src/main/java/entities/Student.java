/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value = "Student")
public class Student extends Person{

    public Student(String name, String address, String phone, String email) {
        super(name, address, phone, email);
    }

    public Student() {
    }

    @Override
    public String toString() {
        return "Name: " + this.getName() + ", Address: " + this.getAddress() + ", Phone: " + this.getPhone() + ", E-mail: " + this.getEmail();
    }
    
    
}
