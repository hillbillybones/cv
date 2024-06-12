
#let (
  tel, 
  email, 
  linkedin, 
  skills, 
  experience, 
  education, 
  ..data
) = yaml("./cv.yaml")

#let reset(x) = text(weight: "regular", size: 11pt, x)

= Gregory (Bear) Shuford
#link("tel:" + tel.replace(" ", ""), tel) #sym.circle.filled.small
#link("mailto:" + email, email) #sym.circle.filled.small
#link("https://linkedin.com/in/" + linkedin, "linkedin.com/in/" + linkedin)

#if "objective" in data [
  == Objective
  #v(3.5pt)
  #data.objective
  #v(5.6pt)
]

== Experience
#for (title, dates, company, location, duration, responsibilities) in experience [
  === #title · #reset[_#(company)_ · #location #h(1fr) #dates · _#(duration)_]
  #v(3.4pt)
  #for responsibility in responsibilities [
     - #responsibility
    ]
]
#v(7pt)

== Skills
#let tableProps = (columns: 2, stroke: none, inset: (left: 0pt), column-gutter: 8pt)
#let skills = skills.map(((x, y)) => ([*#x*], y.join(" · "))).flatten()
#table(..tableProps, ..skills)
#v(3pt)

== Education
#for (degree, dates, institution, ..edu) in education [
  === #degree #reset[ · _#(institution)_ #if "details" in edu [· #edu.details ] #h(1fr) #dates]
  #if "description" in edu {
    v(2.4pt)
    edu.description
  }
]