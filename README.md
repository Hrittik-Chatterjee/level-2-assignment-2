## 1)What is PostgreSQL?
**উত্তর:**  PostgreSQL হলো একটি শক্তিশালী, ওপেন সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম। এটা এমন একটি সফটওয়্যার যা ডাটা সহজে সংরক্ষণ ও পরিচালনা করতে সাহায্য করে। অন্য অনেক ডাটাবেসের মতো এটি সাধারণ TABLE, COLUMN, এবং ROW ব্যবহার করে ডাটা রাখে, কিন্তু PostgreSQL এর কিছু বিশেষ Feature আছে যা অনেক RDBMS এ পাওয়া যায় না।

যেমন:

JSON এবং XML ডাটাও সেভ করতে পারে, তাই  ডাটার মধ্যে জটিল এবং ফ্লেক্সিবল ডাটা স্টোর করা যায়, যা অনেক ডাটাবেস সহজে করতে পারে না।

এটি ACID কমপ্লায়েন্ট, মানে ডাটা সবসময় সঠিক থাকবে এমন ব্যবস্থা আছে, এমনকি বিদ্যুৎ চলে গেলেও।

PostgreSQL এ নিজের মতো নতুন ডাটা টাইপ, ফাংশন এবং অপারেটর বানানো যায় , যা অন্য ডাটাবেসে খুব সহজে করা যায় না।

এছাড়া PostgreSQL খুব ভালোভাবে জিওগ্রাফিকাল ডাটা হ্যান্ডেল করতে পারে, যা মানচিত্র এবং লোকেশন ভিত্তিক অ্যাপ্লিকেশনের জন্য খুবই দরকারি।

PostgreSQL এর Community খুব শক্তিশালী এবং নিয়মিত নতুন নতুন Feature নিয়ে আসে।

সব মিলিয়ে, PostgreSQL শুধু সহজ নয়, অনেক জটিল কাজও করতে পারে যা অন্য অনেক ডাটাবেস সিস্টেম করতে পারে না।


## 2) How can you modify data using UPDATE statements?
**উত্তর:**    UPDATE statement ব্যবহার করে টেবিলের Existing ডাটা পরিবর্তন করা যায়। এটি ব্যবহার করে একটি বা একাধিক Coulumn এর মান নির্দিষ্ট Condition পূরণ করা ROW তে পরিবর্তন করা যাই।

*Example:* একটি টেবিলের নাম employees। এই টেবিলে employees der নাম, বেতন, এবং ডিপার্টমেন্ট সংরক্ষিত আছে।
এখন ইটা আপডেট করতে আমাদের নিচের query ব্যবহার করতে হবে

UPDATE employees

SET salary = salary * 1.10

WHERE department = 'Sales';



## 3)  What is the difference between the VARCHAR and CHAR data types?
**উত্তর:**    CHAR(n) সবসময় ঠিক n জায়গা বরাদ্দ করে। যদি ডাটার দৈর্ঘ্য n এর চেয়ে কম হয়, তখন বাকি জায়গাগুলো স্পেস দিয়ে পূরণ করা হয়।

VARCHAR(n) হলো ভ্যারিয়েবল লেন্থ টাইপ, যা সর্বোচ্চ n সংখ্যক ক্যারেক্টার সংরক্ষণ করতে পারে এবং শুধু প্রয়োজনীয় জায়গা নেয়।




## 4) What are the LIMIT and OFFSET clauses used for?
**উত্তর:**    LIMIT ব্যবহার করে একটি Query কতগুলো Row ফলাফল দিবে তা নির্দিষ্ট করা হয়। OFFSET ব্যবহার করে কতগুলো Row Skip করতে হবে তা নির্ধারণ করা হয়। সাধারণত এগুলো পেজিনেশন করার জন্য একসাথে ব্যবহার করা হয়।

*Example:* 

SELECT * FROM table_name 

LIMIT 10 OFFSET 20;






## 5) Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**উত্তর:**    Primary Key: একটি বা একাধিক Column যা টেবিলের প্রতিটি Row ইউনিক ভাবে চিনতে সাহায্য করে। এর মান কখনো NULL হতে পারে না এবং UNIQUE হতে হয়।

Foreign Key: একটি বা একাধিক কলাম যা অন্য টেবিলের PRIMARY KEY Reference করে, এবং এর মাধ্যমে দুই টেবিলের মধ্যে সম্পর্ক স্থাপন হয়।



