user: 
login and logout 
account can be activated 
password can be reset is available 
roles: 
1.admin: can crud users, lessons, and exams  
2.tutor: create lessons and exams 
3.student: make use of lessons and pass exams 


lesson: 
belongs_to user (tutor) 
has_many users (students) through student_lessons 
content => text 
video_url => 
presentation_url , 

exam:
belongs_to user (tutor) 
has_many users (students) through student_exams 
has_may questions 
result


question:
type => mcq, assay 
if mcq => multiple answers => answers are separated using vertical bar 	
mcq has right answers
if assay => one answer only  



