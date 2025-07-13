package hospitalmanagementsystem.patient;

public class Patient {
   private int id;
   private String name;
   private String gender;
   private String phone;
   private int age;
   private String address;
   private String disease;
   private String admitStatus;
   private String roomNumber;


   public String getName() { return name; }
   public void setName(String name) { this.name = name; }

   public String getGender() { return gender; }
   public void setGender(String gender) { this.gender = gender; }

   public String getPhone() { return phone; }
   public void setPhone(String phone) { this.phone = phone; }

   public int getAge() { return age; }
   public void setAge(int age) { this.age = age; }

   public String getAddress() { return address; }
   public void setAddress(String address) { this.address = address; }

   public String getDisease() { return disease; }
   public void setDisease(String disease) { this.disease = disease; }

   public String getAdmitStatus() { return admitStatus; }
   public void setAdmitStatus(String admitStatus) { this.admitStatus = admitStatus; }

   public String getRoomNumber() { return roomNumber; }
   public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }
}
