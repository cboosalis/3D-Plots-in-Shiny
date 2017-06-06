shinyUI(
  fluidPage(theme="bootstrap.css",
            (navbarPage("Shiny Examples",
                        tabPanel("3D Plot Demo", 
                                 sidebarPanel(
                                   h1("Learning from 3D Plots"),
                                   p("
                                    This is an example of an interactive 3D plot with its corresponding dataset. The cube can be rotated and magnified using the mouse. The dataset can be sorted and filtered through the search function.
                                    Direct ratings from university supervisors,  scores on performance assessment, and student self- perceptions are plotted in three dimensional space.
                                    Try rotating the cube to look at the various groupings of students: Beginning, Novice, and Apprentice.
                                     "),
                                   #br(),
                                   div(img(src="legend.png", height=100, width=180), style="text-align: center"),
                                   br(),
                                   p("
                                    By rotating the cube, you should notice that while the Beginners and Apprentices are cohesive, the Novice group
                                    is dispersed. What might account for the lack of cohesion among the members of the Novice group?
                                    Filtering the table results for Student 6 and Student 25 is revealing.
                                    Student 6 has low performance assessment and supervisor ratings, but an exceptionally high self- rating.
                                    Student 25 has high performance assessment and supervisor ratings, but a very low self- rating. Clearly,
                                    there is a mismatch between student self- perceived ability and objective performance ratings in both cases. 
                                    We do not learn why the mismatch exists, but, at least, we have a place from which to begin our inquiry and intervention.
                                   "),
                                   
                                   p("
                                     In summary, this manner of plotting data points in three dimensions helps us to triangulate findings and identify likely starting points to investigate of phenomena.
                                     We have another tool to make use of all of the data that we collect in our programs.
                                     "),
                                   p("Chris Nicholas Boosalis - https://github.com/cboosalis"),
                                   br(),
                                   
                                   div(style = "margin-left: 2em; text-indent: -2em; ",
                                       HTML("
                                            Boosalis, C.N. (2016, May). 
                                            <i>Plotting direct and indirect measures of student achievement and 
                                            perception in two and three dimensions using R.</i> 
                                            Pacific Conference on Statistical Computing and Data Mining, 
                                            Palm Springs, California."))
                                 ),          
                                 mainPanel(
                                   br(),
                                   br(),
                                   h3("Ability to Differentiate Instruction for English Learners"),
                                   rglwidgetOutput('thewidget1'),
                                   h3("Dataset"),
                                   dataTableOutput('table')
                                 )
                                 
                        ),
                        tabPanel("CoE Dashboard",
                                 sidebarPanel(
                                   h1("CoE Learning Outcomes"),
                                   p("
                                     This example reflects a Student Learning Outcome viewer for five 
                                     learning outcomes from three different programs. Select an outcome,
                                     select or deselect various programs, and then click the play button.
                                     You can also select specific programs on the chart and experiment rolling
                                     over content on the chart and enabling trails. Don't forget to click the play button
                                     on the motion chart and to toggle between the line chart and bar graphs (top of the motion chart), too. 
                                     "),
                                   radioButtons("selectSLO", "Select SLO",
                                                choices = c(
                                                  "1. Advocate for Children & Families" = "1", 
                                                  "2. Equity and Social Justice"= "2", 
                                                  "3. Active Civic Engagement"= "3", 
                                                  "4. Collaboration and Communication"= "4", 
                                                  "5. Human Capital"= "5"),
                                                selected = "1"),
                                   checkboxGroupInput("selectDEPARTMENT", "Select Department",
                                                      choices = c("Teacher Education", "Health Professionals", "Leadership"),
                                                      selected = "Health Professionals"),
                                   p("
                                     College of Education credential programs collect a great deal of student data about student performance.
                                     While the data are most useful at the student level to chart individual candidate growth and progress, 
                                     program managers are expected to make data- informed decisions about program effectiveness based on these data points. 
                                     In addition, the data are often mapped to Student Learning Outcomes (SLOs) with the expectations that unit leaders, 
                                     department chairs, and program coordinators will make use student performance data on these SLOs. The problems is that		
                                     when data are aggregated beyond the student or program level to higher levels at the unit level, the meaning of these 
                                     data can dissipate. 
                                     "),
                                   
                                   p("
                                     How does meaning disappear? Take a learning outcome such as 1. Advocate for Children and their Families. The assessment and survey data that 
                                     map to this learning outcome might align very neatly to a program standard in the elementary teaching credential program and
                                     to a learning outcome in the doctoral program independently, but their contexts are lost if the data are combined and reported as one aggregated mean. 
                                     "),
                                   p("
                                     The power of this dashboard is that it preserves the meaning of direct and indirect data collected at the program level, while
                                     enabling us to see differences in plot-points and their trajectories over time. Comparisons can be made and discussions can be held about the 
                                     changes that may have influenced how the points rise, fall, and move throughout the course of many semesters.
                                     "),

                                   p("Chris Nicholas Boosalis - https://github.com/cboosalis"),
                                   br(),
                                   
                                   div(style = "margin-left: 2em; text-indent: -2em; ",
                                       HTML("
                                            Boosalis, C.N. & Myhre, O.R. (2016, March). 
                                            <i>Looming, plotting, and animating historical time series measures of 
                                            direct and indirect assessments of student learning outcomes from 
                                            multiple credential programs using r and r-studio.</i> 
                                            Paper presentation at the Society for Information Technology and 
                                            Teacher Education 2016, Savannah, Georgia.
                                            "))
                                 ),
                                 
                                 mainPanel(
                                   br(),
                                   br(),
                                   h3("College of Education"),
                                   htmlOutput("motionchart"),
                                   br(), br(),
                                   tableOutput("results")
                                 )
                        ),                                    
                        tabPanel("University Dashboard", 
                                 sidebarPanel(
                                   h1("Learning Outcomes across University Programs"),
                                   p("
                                      Like the Student Learning Outcome dashboard for the College of Education, 
                                      this example shows how the approach can easily scale and accomodate a 
                                      university-wide endeavor.
                                     
                                     "),
                                   
                                   radioButtons("selectSLO2", "Select SLO",
                                                choices = c(
                                                 "1. Critical Analysis"= "1", 
                                                 "2. Integrative Thinking"= "2", 
                                                 "3. Effective Communication to K-14 Stakeholders"= "3", 
                                                 "4. Understanding Professional Role"= "4", 
                                                 "5. Practical Applications"= "5"
                                                  ),
                                                selected = "1"),
                                   checkboxGroupInput("selectCOLLEGE", "Select College",
                                                      choices = c(
                                                        "Education",
                                                        "Arts and Letters",
                                                        "Natural Sciences",
                                                        "Continuing Education",
                                                        "Mathematics",
                                                        "Computer Science"
                                                      ),
                                                      selected = "Education"),
                                   p("Chris Nicholas Boosalis - https://github.com/cboosalis"),
                                   br(),
                                   
                                   div(style = "margin-left: 2em; text-indent: -2em; ",
                                       HTML("
                                            Boosalis, C.N., Myhre, O., Pokherl, B., & Turner, C. (2016, November). 
                                            <i>Creating dashboards of direct and indirect slos measures in r. 
                                            </i>Paper presentation at the California Association for Institutional Research, Los Angeles, California. (Forthcoming)
                                            "))
                                    ),
                                 mainPanel(
                                   br(),
                                   br(),
                                   h3("A Plot of Graduate Programs"),
                                   htmlOutput("motionchart2"),
                                   br(), br(),
                                   tableOutput("results2")
                                 )
                        ),
                        tabPanel("TPE Dashboard",               
                                 sidebarPanel(
                                   h1("Teaching Performance Expectations"),
                                   p("
                                    This is a complex plot of the Teaching Performance Expectations. You can select only one program at a time in this example,
                                    but you can select as many TPEs as desired. Try selecting all TPEs and then click the play button.
                                    We now have an example where the more complex the selections, then the more complicated the plot.
                                    . Other data-processing languages exist 
                                    that manage complicated dataframes more efficiently. The link below is to a video 
                                    of an RDF-derived language that parses 15,000 records with ease that I built in DSPL. Note that the video has no sound.
                                     "),
                                   tags$div(
                                   HTML("<center><a href='https://vimeo.com/175962306' target='_blank'>Click Here - https://vimeo.com/175962306</a></center>")
                                        ),
                                   br(),
                                   radioButtons("selectPROGRAM", "Select Program",
                                                choices = c(
                                                  "MS-TRAD",
                                                  "MS-BILINGUAL",
                                                  "SS-BILINGUAL",
                                                  "SS-TRAD",
                                                  "EDS-MM",
                                                  "EDS-MS"
                                                ),
                                                selected = "MS-TRAD"),
                                   checkboxGroupInput("selectTPE", "Select TPEs",
                                                      choices = c(
                                                        "TPE 1: Engaging and Supporting All Students",
                                                        "1.1  Apply knowledge of students to engage them in learning.  ",
                                                        "1.2  Maintain ongoing communication with students and families",
                                                        "1.3  Connect subject matter to real-life contexts",
                                                        "1.4  Use. appropriate instructional strategies. within the Classroom",
                                                        "1.5  Promote students' critical and creative thinking",
                                                        "1.6  Provide a supportive learning environment",
                                                        "1.7  Provide students to access  visual and performing arts",
                                                        "1.8  Monitor student learning and adjust instruction",
                                                        "TPE 2: Creating and Maintaining Effective Environments for Student Learning",
                                                        "2.1  Promote students' social-emotional growth",
                                                        "2.2  Create learning environments. that promote productive student learning",
                                                        "2.3  Establish, maintain, and monitor inclusive learning environments ",
                                                        "2.4  Know how to access resources to support students",
                                                        "2.5  Maintain high expectations for learning",
                                                        "2.6  Establish and maintain clear expectations for positive classroom behavior",
                                                        "TPE 3: Understanding and Organizing Subject Matter for Student Learning",
                                                        "3.1  Demonstrate knowledge of subject matter",
                                                        "3.2  Use knowledge about students and learning goals to organize the curriculum",
                                                        "3.3  Plan instruction consistent with current subject-specific pedagogy",
                                                        "3.4  Individually plan for effective subject matter instruction.",
                                                        "3.5  Adapt and support the acquisition of academic language",
                                                        "3.6  Use a range of technology to facilitate students' equitable access to the curriculum.",
                                                        "3.7  Model and develop digital literacy by using technology",
                                                        "3.8  Demonstrate knowledge of effective teaching strategies aligned with. educational technology standards."         
                                                        
                                                      ),
                                                      selected = "TPE 1: Engaging and Supporting All Students")
                                 ),
                                 mainPanel(
                                   br(),
                                   br(),
                                   h3("A Plot of TPEs and Various Credential Programs"),
                                   htmlOutput("motionchart4"),
                                   br(), br(),
                                   tableOutput("results4")
                                 )                
                        )
                        
            ))
  )
)



