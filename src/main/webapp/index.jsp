<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>COMP367 Web App</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }

            .container {
                text-align: center;
                padding: 2rem;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #333;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <% java.util.Calendar calendar=java.util.Calendar.getInstance(); int
                hour=calendar.get(java.util.Calendar.HOUR_OF_DAY); String greeting=(hour < 12) ? "Good Morning"
                : "Good Afternoon" ; %>
                <h1>
                    <%= greeting %>, Shrijana! Welcome to COMP367
                </h1>
        </div>
        </div>
    </body>

    </html>