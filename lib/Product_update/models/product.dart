class Product {
  final int id, text;
  final String title, title1, description, image, title2, description1;

  Product(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.text,
      this.title1,
      this.title2,
      this.description1});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 4,
    text: 5800,
    //price: 68,
    title: "Nike React Infinity Run Flyknit 2",
    title1: "ราคา 5,800 สินค้าเข้าวันที่ 29/มีนาคม/2024",
    image: "assets/Nike6.png",
    description:
        "Nike React Infinity Run Flyknit 2 ยังคงช่วยคุณให้วิ่งได้ไม่มีหยุดต่อไป มาพร้อมส่วนบนโฉมใหม่ที่ใช้เทคโนโลยี Flywire โดยผสานเข้ากับ Flyknit เพื่อการรองรับและการระบายอากาศในจุดที่ต้องการ "
        "ส่วนโฟมที่ยกตัวหนาก็ให้การตอบสนองอย่างนุ่มนวลและความสบายยาวนาน คู่นี้ยังคงเป็นรองเท้าคู่หนึ่งของเราที่ผ่านการทดสอบมามากที่สุด โดยดีไซน์มาเพื่อช่วยให้สัมผัสถึงศักยภาพเมื่อเท้าสัมผัสกับพื้นถนน",
    description1: "สีที่แสดง: Bright Crimson/ดำ/Dark Smoke Grey/ขาว"
        "สไตล์: CT2357-600",
  ),
  Product(
    id: 9,
    text: 4269,
    //price: 39,
    title: "Nike React Infinity Run Flyknit A.I.R. Chaz Bear",
    title1: "ราคา 4,269 สินค้าเข้าวันที่ 29/มีนาคม/2024",
    image: "assets/Nike7.png",
    description:
        "Nike React Infinity Run Flyknit ดีไซน์มาเพื่อช่วยลดอาการบาดเจ็บและให้คุณวิ่งได้อย่างต่อเนื่อง มาพร้อมโฟมที่มากขึ้นและรายละเอียดส่วนบนที่พัฒนาขึ้น เพื่อให้สัมผัสที่แน่นกระชับและลดแรงกระแทกได้ดี "
        "ผูกเชือกแล้วสัมผัสถึงศักยภาพของคู่นี้เมื่อออกลุยบนถนนได้เลย ส่วนกราฟิกก็ดีไซน์โดยนักดนตรีชื่อ Chaz Bear",
    description1: "สีที่แสดง: ดำ/Sail/Rush Violet/Bright Cactus"
        "สไตล์: CZ2358-001",
  ),
  Product(
    id: 8,
    text: 5000,
    //price: 39,
    title: "Nike Air Zoom Pegasus 37 Eliud Kipchoge",
    title1: "ราคา 5,000 สินค้าเข้าวันที่ 29/มีนาคม/2024",
    image: "assets/Nike8.png",
    description:
        "ให้การวิ่งมีชีวิตชีวาอีกครั้งพร้อมค้นพบปีกของคุณด้วย Nike Air Zoom Pegasus 37 คู่นี้ให้ทรงและสัมผัสอันแน่นกระชับในแบบที่นักวิ่งชื่นชอบ มาพร้อมระบบลดแรงกระแทกที่ปลายเท้าและโฟมเพื่อการตอบสนอง"
        " และผลลัพธ์ที่ได้คือรองเท้าผ้าใบที่ทนทานและมีน้ำหนักเบาซึ่งดีไซน์มาเพื่อการวิ่งในทุกวัน กราฟิกและสีสันต่างๆ ยกย่องให้กับ Eliud Kipchoge เจ้าของสถิติโลกด้วยเวลา 1 ชั่วโมง 59 นาที ซึ่งไม่เคยมีใครทำได้มาก่อน",
    description1: "สีที่แสดง: ขาว/Chile Red/Lucky Green/ดำ"
        "สไตล์: DD9478-100",
  ),
];
