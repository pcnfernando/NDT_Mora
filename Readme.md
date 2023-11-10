# Sample Web Application
- `webApplication/`: The main directory for the Ballerina web application.
  - `UI/`: Contains the user interface (HTML and CSS).
    - `ui.html`: HTML file for the user interface.
  - `service.bal`: Ballerina file containing the backend logic and API implementation.

## Getting Started

Follow the steps below to set up and run the web application:

### Prerequisites

Make sure you have the following installed:

- [Ballerina](https://ballerina.io/downloads/)

### Running the Service

1. Clone the repository:

   ```bash
   git clone https://github.com/pcnfernando/NDT_Mora.git
   ```

2. Navigate to the project directory:
    ```bash
    cd NDT_Mora/webApplication
    ```
3. Build and run the Ballerina service:    
    ```bash
    bal run webApplication/service.bal
    ```

### Deploying UI

1. Navigate to the UI directory:
    ```bash
    cd NDT_Mora/webApplication/UI
    ```

2. Build the Docker Image for the HTML Server
   ```bash
   docker build -t html-server-image:v1 .
   ```

3. Run the Docker Container
    ```bash
    docker run -d -p 80:80 html-server-image:v1
    ```
4. Test the UI is up   
    You can view it in the browser now by going to localhost:80 and you should see your HTML file.

# Extra resources
- `resources/`
  - `docker-compose.yaml`: Docker Compose file for deploying the mysql server for your reference.