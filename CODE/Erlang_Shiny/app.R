#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# CTMC SIS

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Exponential and Erlang distributions"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("mean_expon",
                        "Mean of the exponential (days):",
                        min = 1,
                        max = 30,
                        value = 7),
            sliderInput("nb_compartments",
                        "Number of compartments:",
                        min = 0,
                        max = 20,
                        value = 2,
                        step = 1)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("a_distPlot",width="1000px")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # Expression that generates the plots. The expression is
    # wrapped in a call to renderPlot to indicate that:
    #
    #  1) It is "reactive" and therefore should re-execute automatically
    #     when inputs change
    #  2) Its output type is a plot
    
    output$a_distPlot <- renderPlot({
        params <- list()
        
        params$mean_expon = input$mean_expon
        params$nb_compartments = input$nb_compartments
        # The displayed times
        t = seq(0, 50, 0.1)
        # Distribution and survival for the exponential
        exp_distrib = dexp(x = t, rate = 1/params$mean_expon)
        exp_surv = 1-pexp(q = t, rate = 1/params$mean_expon)
        # Now do the Erlang
        params$mean_erlang = params$mean_expon/params$nb_compartments
        gamma_distrib = dgamma(x = t, shape = params$nb_compartments, scale = params$mean_erlang)
        gamma_surv = 1-pgamma(q = t, shape = params$nb_compartments, scale = params$mean_erlang)
        # Plot the results
        par(mfrow=c(1,2))
        plot(t, exp_distrib,
             xlab="Time (days)",
             ylab="Probability density function value",
             type = "l", lwd = 2, 
             ylim = c(0, max(max(exp_distrib), max(gamma_distrib))), 
             col = "blue")
        lines(t, gamma_distrib, lwd = 2, type = "l", col = "red")
        legend("topright", 
               legend = c("Exponential",sprintf("Erlang (%d compartments)", params$nb_compartments)), 
               col=c("blue","red"), 
               lwd = c(2,2), lty = c(1,1))
        plot(t, exp_surv,
             xlab="Time (days)",
             ylab="Survival",
             type = "l", lwd = 2, ylim = c(0, 1), col = "blue")
        lines(t, gamma_surv, lwd = 2, type = "l", col = "red")
        legend("topright", 
               legend = c("Exponential",sprintf("Erlang (%d compartments)", params$nb_compartments)), 
               col=c("blue","red"), 
               lwd = c(2,2), lty = c(1,1))
        
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
