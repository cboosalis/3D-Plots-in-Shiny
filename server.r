table = data.frame(DATA) 
colnames(table) <- c("Performance Assessment","Self-Assessment", "Supervisor Rating","Sum","Level","Case")
options(rgl.useNULL = TRUE)
shinyServer(function(input, output, session) {
  ###3D-PLOT CODE
  DATA$LEVEL1 <- factor(DATA$LEVEL, level=c("Beginner", "Novice", "Apprentice") )
  DATA$LEVEL2 <- as.integer(DATA$LEVEL1)
  
  pc <- princomp(DATA[,1:3], cor=FALSE, scores=TRUE)
  
  open3d()
  plot3d(pc$scores[,1:3], col=DATA$LEVEL2, 
         #main = "Differentiating Instruction for English Learners",
         xlab ="Performance Assessment",
         ylab="Student Self-Perception", 
         zlab="Supervisor Rating of Student Teaching", 
         size=12)
  
  text3d(pc$scores, texts=paste(c(DATA$CASE)), size=10, color="blue", adj=2)
  
  scene1 <- scene3d()
  rgl.close()
  
  save <- options(rgl.inShiny = TRUE)
  on.exit(options(save))
  ###3D-PLOT-CODE-END
  
  ###MOTIONCHART FILTER COE
  filtered <- reactive({
    a <- subset(DATA1, SLO %in% input$selectSLO & DEPARTMENT %in% input$selectDEPARTMENT)
    a <- droplevels(a)
    return(a)
    
  })
  
  ###MOTIONCHART FILTER UNIVERSITY
  filtered2 <- reactive({
    b <- subset(DATA3, SLO %in% input$selectSLO2 & COLLEGE %in% input$selectCOLLEGE)
    b <- droplevels(b)
    return(b)
    
  })
  
  ###MOTIONCHART FILTER TPE
  filtered4 <- reactive({
    c <- subset(DATA4, PROGRAM %in% input$selectPROGRAM & TPE %in% input$selectTPE)
    c <- droplevels(c)
    return(c)
    
  })  
  
  
  ###3D-PLOT-OUTPUT
  output$thewidget1 <- renderRglwidget({
    rglwidget(scene1)
  })
  
  output$table = renderDataTable({table})
  
  ###MOTIONCHART OUTPUT COE
  output$motionchart <- renderGvis({
    motionData = as.data.frame(filtered())
    return (gvisMotionChart(motionData,"PROGRAM",timevar="YEAR",
                            xvar="DIRECT_MEASURE",
                            yvar="INDIRECT_MEASURE",
                            date.format="%Y"))
    
  })
  
  output$results <- renderTable({
    filtered()
  })
  ###MOTIONCHART OUTPUT COE END

  ###MOTIONCHART OUTPUT UNIVERSITY  
  output$motionchart2 <- renderGvis({
    motionData2 = as.data.frame(filtered2())
    return (gvisMotionChart(motionData2,"PROGRAM",timevar="YEAR",
                            xvar="DIRECT_MEASURE",
                            yvar="INDIRECT_MEASURE",
                            date.format="%Y"))
    
  })
  
  output$results2 <- renderTable({
    filtered2()
  })  
  ###MOTIONCHART OUTPUT UNIVERSITY END  
  ###MOTIONCHART OUTPUT TPE END  
  output$motionchart4 <- renderGvis({
    motionData4 = as.data.frame(filtered4())
    return (gvisMotionChart(motionData4,"ID",timevar="DATE4",
                            xvar="DIRECT",
                            yvar="INDIRECT"
                            #date.format="%Y"
    ))
    
  })
  
  output$results4 <- renderTable({
    filtered4()
  })

  
  
  
})

#Credit to the following blogs:
#Dean Attali: http://deanattali.com/blog/building-shiny-apps-tutorial/
#Hernán Resnizky: https://hernanresnizky.com/
#Thank you! Chris Boosalis
#http://bootswatch.com/