
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(FinCal)

shinyServer(function(input, output) {
        
        output$distPlot <- renderPlot({
                
                # create a function to calculate total amount of principal paid, to date
                
                paid <- function(cost, tax, dp, mos, int){
                        x <- 1:as.numeric(mos)
                        loan <- as.numeric(cost) * (1 + as.numeric(tax)/100) - (as.numeric(dp))
                        
                        pmt <- pmt(as.numeric(int)/100
                                  ,as.numeric(mos)
                                  ,loan
                                  ,0)
                        
                        pd <- as.numeric(cost) + 
                                as.numeric(dp) +
                                round(fv(as.numeric(int)/100
                                        ,x
                                        ,loan
                                        ,pmt)
                                     ,2)
                        pd
                }
                
                x1 <- 1:input$mos1
                pd1 <- paid(input$salePrice1,input$taxRate1,input$downpPmt1
                            ,input$mos1,input$intRate1)
                
                x2 <- 1:input$mos2
                pd2 <- paid(input$salePrice2,input$taxRate2,input$downpPmt2
                            ,input$mos2,input$intRate2)
                
                x3 <- 1:input$mos3
                pd3 <- paid(input$salePrice3,input$taxRate3,input$downpPmt3
                            ,input$mos3,input$intRate3)
                
                # plot the total amount of principal paid, to date, at each month
                plot(x1, pd1, col='red',type='b',xlab = '# months of payback period',ylab = 'Total amount paid (USD)',pch=19
                     ,xlim = c(0,max(input$mos1,input$mos2,input$mos3))
                     ,ylim = c(0,1.5 * max(as.numeric(input$salePrice3)
                                     ,as.numeric(input$salePrice2)
                                     ,as.numeric(input$salePrice1)))
                     )
                points(x2, pd2, col='blue',type='b',pch=19)
                points(x3, pd3, col='green',type='b',pch=19)
                legend(x='topleft'
                       ,pch=19
                       ,legend=c('Vehicle #1','Vehicle #2','Vehicle #3')
                       ,col=c('red','blue','green'))

        }
        #,width = 800, height = 400
        )
        
        # add sales tax to calculate total cost of each vehicle
        output$totalPrice1 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice1) 
                               * (1 + as.numeric(input$taxRate1)/100)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$totalPrice2 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice2) 
                               * (1 + as.numeric(input$taxRate2)/100)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$totalPrice3 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice3) 
                               * (1 + as.numeric(input$taxRate3)/100)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        # Add sales tax and deduct down payment to calculate Loan Amount
        output$totalLoan1 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice1) 
                               * (1 + as.numeric(input$taxRate1)/100)
                               -(as.numeric(input$downpPmt1))
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$totalLoan2 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice2) 
                               * (1 + as.numeric(input$taxRate2)/100)
                               -(as.numeric(input$downpPmt2))
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$totalLoan3 <- renderText(
                paste0('$ '
                       ,formatC(
                               as.numeric(input$salePrice3) 
                               * (1 + as.numeric(input$taxRate3)/100)
                               -(as.numeric(input$downpPmt3))
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        # Add sales tax, deduct down payment, and calculate Monthly Payment using FinCal::pmt
        output$pmt1 <- renderText(
                paste0('$ '
                       ,formatC(
                               -pmt(as.numeric(input$intRate1)/1200
                                    ,as.numeric(input$mos1)
                                    ,as.numeric(input$salePrice1) 
                                    * (1 + as.numeric(input$taxRate1)/100)
                                    -(as.numeric(input$downpPmt1))
                                    ,0.0)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$pmt2 <- renderText(
                paste0('$ '
                       ,formatC(
                               -pmt(as.numeric(input$intRate2)/1200
                                    ,as.numeric(input$mos2)
                                    ,as.numeric(input$salePrice2) 
                                    * (1 + as.numeric(input$taxRate2)/100)
                                    -(as.numeric(input$downpPmt2))
                                    ,0.0)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        output$pmt3 <- renderText(
                paste0('$ '
                       ,formatC(
                               -pmt(as.numeric(input$intRate3)/1200
                                    ,as.numeric(input$mos3)
                                    ,as.numeric(input$salePrice3) 
                                    * (1 + as.numeric(input$taxRate3)/100)
                                    -(as.numeric(input$downpPmt3))
                                    ,0.0)
                               ,2
                               ,format = 'f'
                       )
                )
        )
        
        
})
