
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Car Payment Calculator (all prices USD)"),
        fluidRow(
                column(3,
                       p('1. Start by entering the sales prices for up to three vehicles.')
                ),
                column(3,
                       p('2. Next enter how much of a down payment you plan to make on each vehicle.')
                ),
                column(3,
                       p('3. Enter the sales tax rate. Note that this could vary if sellers are in different counties and/or states.')
                ),                
                column(3,
                       p('4. Finally, enter the interest rate at which you expect to be able to finance each potential purchase.')
                )
        ),
        
        p('5. The Total Sales Price, Total Loan Amount, and Monthly Payment amounts will update in real time. The line plots indicate how long it will take you to complete paying off your vehicle loan.', align='center'),

        fluidRow(
                column(12,
                       plotOutput("distPlot", height='300px')
                )
        ),
        
        # hr(),
        
        fluidRow(
                # inputs and outputs for first of up to three different car payment calculators
                column(4,
                       h4(tags$u(p('Vehicle #1', align='center', col='red'))),
                       # Outputs
                       fluidRow(
                               column(6, align='center',
                                      tags$b(p('Total Sales Price'))
                                      ,textOutput('totalPrice1'))
                               ,column(6, align='center',
                                       tags$b(p('Total Loan Amt'))
                                       ,textOutput('totalLoan1'))
                       ),
                       
                       br(),
                       
                       fluidRow(
                               column(12, align="center",
                                      tags$b(p('Monthly Payment'))
                                      ,textOutput('pmt1')
                                      )
                       ),
                       
                       hr(),
                       
                       # Inputs
                       fluidRow(
                               column(6,
                                      textInput(inputId="salePrice1", label = "1. Vehicle Price", value = 46000))
                               ,column(6,
                                       textInput(inputId="downpPmt1", label = "2. Down Payment", value = 10000))
                       ),
                       fluidRow(
                               column(6,
                                      textInput(inputId="taxRate1", label = "3. Sales Tax(%)", value = 7.5))
                               ,column(6,
                                       textInput(inputId="intRate1", label = "4. Interest Rate(%)", value = 1.9))
                       ),
                       sliderInput("mos1",
                                   "Payout Period (mos):",
                                   min = 12,
                                   max = 60,
                                   value = 48,
                                   step = 6)
                ),
                # inputs and outputs for second of up to three different car payment calculators
                column(4,
                       h4(tags$u(p('Vehicle #2', align='center'))),
                       # Outputs
                       fluidRow(
                               column(6, align='center',
                                      tags$b(p('Total Sales Price'))
                                      ,textOutput('totalPrice2'))
                               ,column(6, align='center',
                                       tags$b(p('Total Loan Amt'))
                                       ,textOutput('totalLoan2'))
                       ),
                       
                       br(),
                       
                       fluidRow(
                               column(12, align="center",
                                      tags$b(p('Monthly Payment'))
                                      ,textOutput('pmt2')
                               )
                       ),
                       
                       hr(),
                       
                       # Inputs
                       fluidRow(
                               column(6,
                                      textInput(inputId="salePrice2", label = "1. Vehicle Price", value = 35000))
                               ,column(6,
                                       textInput(inputId="downpPmt2", label = "2. Down Payment", value = 10000))
                       ),
                       fluidRow(
                               column(6,
                                      textInput(inputId="taxRate2", label = "3. Sales Tax(%)", value = 7.5))
                               ,column(6,
                                       textInput(inputId="intRate2", label = "4. Interest Rate(%)", value = 1.9))
                       ),
                       sliderInput("mos2",
                                   "Payout Period (mos):",
                                   min = 12,
                                   max = 60,
                                   value = 24,
                                   step = 6)
                ),
                # inputs and outputs for third of three different car payment calculators
                column(4,
                       h4(tags$u(p('Vehicle #3', align='center'))),
                       # Outputs
                       fluidRow(
                               column(6, align='center',
                                      tags$b(p('Total Sales Price'))
                                      ,textOutput('totalPrice3'))
                               ,column(6, align='center',
                                       tags$b(p('Total Loan Amt'))
                                       ,textOutput('totalLoan3'))
                       ),
                       
                       br(),
                       
                       fluidRow(
                               column(12, align="center",
                                      tags$b(p('Monthly Payment'))
                                      ,textOutput('pmt3')
                               )
                       ),
                       
                       hr(),
                       
                       # Inputs
                       fluidRow(
                               column(6,
                                      textInput(inputId="salePrice3", label = "1. Vehicle Price", value = 25000))
                               ,column(6,
                                       textInput(inputId="downpPmt3", label = "2. Down Payment", value = 2000))
                       ),
                       fluidRow(
                               column(6,
                                      textInput(inputId="taxRate3", label = "3. Sales Tax(%)", value = 7.5))
                               ,column(6,
                                       textInput(inputId="intRate3", label = "4. Interest Rate(%)", value = 1.9))
                       ),
                       sliderInput("mos3",
                                   "Payout Period (mos):",
                                   min = 12,
                                   max = 60,
                                   value = 36,
                                   step = 6)
                )
                
        )
))
