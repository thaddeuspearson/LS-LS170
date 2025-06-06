# LS171 Exam Study Guide


## I. [The Internet](https://launchschool.com/lessons/4af196b9/assignments)

#### 1. Have a broad understanding of what the internet is and how it works:

- a network of networks

- example:
    > Computer -> Switch _(LAN)_ -> Router -> ... -> Router -> Switch _(LAN)_ -> Computer

#### 2. Understand the characteristics of the physical network, such as latency and bandwidth:

- bits _(1s and 0s)_ transported through a medium _(copper, fiber, radio, etc)_

- **latency**: a measure of the time it takes for some data to get from one point in a network to another point in a network, a measure of delay

- **bandwidth**: the amount of data that can be sent in a particular unit of time _(typically, a second)_

- Total latency is the sum of the following delays _(in milleseconds)_:
    | Delay Type | Definition | Car Analogy |
    |------------|------------|-------------|
    | **Propogation** | the time a message takes to go from sender to receiver through every medium along the route; a ratio between distance and speed | a car driving along every distinct road from point A to point B |
    | **Transmission Delay** | the time it takes a message to be pushed onto a link | the time the car takes to go through an intersection and get to the next road |
    | **Processing** | the time it takes a message to be handled at each network device along the route | a car going though a checkpoint at each intersection |
    | **Queuing** | the time a message is waiting _(buffering)_ before it is processed | a car waiting in line to go through the intersection checkpoint |

#### 3. Have a basic understanding of how lower level protocols operate:

- Each layer of the internet has it's own protocols, and the data from the previous layer is encapsulated in the protocol data unit of the layer beneath it:

    | Layer | PDU | Protocol | Office Analogy |
    |-------|-----|----------|----------------|
    | Physical | 0s and 1s | Electricity/Light/Radio | the road between offices |
    | Data Link | Ethernet Frame | Ethernet/WiFi | the physical office building |
    | Network | Packet | IP(v4/v6)/ICMP/ARP | the address of the company in the office building |
    | Transport | Segment/Datagram | TCP/UDP | the room in the company office |
    | Application | Application Data | HTTP(S)/SMTP/FTP/DNS... | the product delivereed to the person in the company |

#### 4. Know what an IP address is and what a port number is:

- **IPv4**: 0.0.0.0 - 255.255.255.255 _(2^32 possibilities)_

- **IPv6**: 2001:0db8:85a3:0000:0000:8a2e:0370:7334 _(2^128 possibilities)_

- **Port Numbers**:
    - 65535 total ports (on both TCP and UDP)
    - `0 -> 1023` are "well-known"
    - `1024 -> 49151` are "reserved"
    - `49152 -> 65535` are "ephemeral"

#### 5. Have an understanding of how DNS works:

- **DNS** maps domain names to IP addresses

- Utilizes a recursive DNS lookup:
    - local resolver _(usually ISP)_
    - root nameserver _(13 of them)_
    - TLD nameserver _(.com, .net, .gov)_
    - Authoratative Nameserver _(find it with `dig`)_

#### 6. Understand the [client-server](https://launchschool.com/books/http/read/background#clientsandserver) model of web interactions, and the role of HTTP as a protocol within that model:
 
- client issues requests

- server responds to client requests

- HTTP is a protocol that can be used in the client/server model. The client can use a method (GET, POST, DELETE, PUT...) and sent this along ith optional headers and/or body. The Server then processes the given request and responds accordingly.

<br>

## II. [TCP & UDP](https://launchschool.com/lessons/2a6c7439/assignments)


#### 1. Have a clear understanding of the TCP and UDP protocols, their similarities and differences:

- **TCP**
    - connection-oriented
    - begins with the three-way handshake
    - guarentees in-order delivery, provides deduplication
    - has mechanisms to help make the transmission more efficient _(flow-control/congestion avoidance)_
    - much more overhead
- **UDP**
    - connectionless
    - no guarentees on delivery or order
    - much less overhead
    - great for streaming, VoIP, games etc...

#### Have a broad understanding of the three-way handshake and its purpose:

- Three-way Handshake:
    - Client -> Server: `SYN`
    - Server -> Client: `SYN-ACK`
    - Client -> Server: `ACK`

- Establishes the TCP session for communication between the client and the server

#### Have a broad understanding of flow control and congestion avoidance:

- **flow-control**: 
    - mechanism to keep from overwhelming the receiver
    - works by modifying the `WINDOW` field in the TCP Segment headers
    - a lower amount means to send less data

- **congestion avoidance**: 
    - mechanism to reduce network congestion
    - if many retransmissions occur, TCP can scale back the window size from the sender

## III. [URLs](https://launchschool.com/lessons/cc97deb5/assignments/a28ccb6f)

#### 1. Be able to identify the components of a URL, including query strings:

Example:
- `http://www.example.com:1337/home?query=string`

    | scheme | host | port | path | query parameters(s) |
    |--------|------|------|------|-----------------|
    | `http` | `www.example.com` | `1337` | `/home` | `query=string` |
    

- scheme comes before `://`, identifies the protocol to use
- host comes after `://`, identifies the domain name to go to
- port comes after `:`, identifies the TCP/UDP port to use
- path comes after `/`, identifies where the resource is located
- query parameters start with `?` and are tied to gether with `&`

#### 2. Be able to construct a valid URL:

- see example above

#### 3. Have an understanding of what URL encoding is and when it might be used:
- URL encoding replaces non-conforming characters with a % symbol followed by two hexadecimal digits representing the character's UTF-8 code.
- used to ensure special characters are not mistaken for syntax. Common examples are:
    - `%20` or `+` is ` ` _(space)_
    - `%24` is `$`
    - `%26` is `&`

<br>

## IV. [HTTP and the Request/Response Cycle](https://launchschool.com/lessons/cc97deb5/assignments/83ae67aa)

#### 1. Be able to explain what HTTP requests and responses are, and identify the components of each:

##### HTTP Request Components

1.  ​**Required**:
    - ​HTTP Method​ (GET, POST, PUT, DELETE, etc.) - Specifies the action to be performed
    
    - ​Path​ _(or request-URI)_ - The resource location on the server
    
    - ​HTTP Version​ _(since HTTP 1.0)_ - ex: HTTP/1.1
    
    - Host Header​ _(required since HTTP 1.1)_ - Specifies the domain name

1.  **​Optional**:
    - ​Headers​ - Additional metadata about the request _(Accept-Language, User-Agent, etc.)_
    
    - ​Query Parameters​ - Additional data appended to the URL after a question mark (`?`)
    
    - ​Message Body​ - Content sent to the server _(primarily with POST requests)_

##### HTTP Response Components

1.  **​Required**:
    - ​Status Line​ - Contains the HTTP version, status code, and reason phrase
    
    - Status Code​ _(ex: 200, 404, 500)_ - Indicates the result of the request

2.  **​Optional**:
    - ​Headers​ - Additional metadata about the response _(Content-Type, Server, etc.)_
    
    - ​Message Body​ - The actual content being returned _(HTML, JSON, etc.)_

###### **HTTP Request Methods**

| Method | Description |
|--------|-------------|
| GET | Retrieves data from the server. Should not have any effect on the data. |
| POST | Submits data to be processed by the resource identified by the URL. Often used when creating a new resource. |
| PUT | Updates a resource or creates it if it doesn't exist. Replaces the entire resource.|
| DELETE  | Removes the specified resource. |

#### 2. Be able to describe the HTTP request/response cycle:

- Client sends a request to the server, and provides the required headers and any optional headers necessary to complete the request

- Server processes the request with an appropriate response HTTP status code,

#### 3. Be able to explain what status codes are, and provide examples of different status code types:

- method for the server to respond to an HTTP request and categorize it appropriately

##### **HTTP Response Status Codes**
| Status Code Range | Category | Description |
| ----------------- | -------- | ----------- |
| 100-199 | Informational | Request received, continuing process |
| 200-299 | Success | Request successfully received, understood, and accepted |
| 300-399 | Redirection | Further action needs to be taken to complete the request |
| 400-499 | Client Error  | Request contains bad syntax or cannot be fulfilled |
| 500-599 | Server Error | Server failed to fulfill a valid request |

<br>

##### **Common HTTP Status Codes**
| Status Code | Status Text | Meaning |
|-------------|-------------|---------|
| 200 | OK | The request was handled successfully. |
| 201 | Created | The request was successful and a resource was created. |
| 204 | No Content | The request was successful but no content is returned. |
| 301 | Moved Permanently | The requested resource has been permanently moved. |
| 302 | Found | The requested resource has changed temporarily. Usually results in a redirect. |
| 304 | Not Modified | Resource hasn't been modified since last request. |
| 400 | Bad Request | The server couldn't understand the request due to invalid syntax. |
| 401 | Unauthorized | Authentication is required and has failed or not been provided. |
| 403 | Forbidden | The client doesn't have permission to access the resource. |
| 404 | Not Found | The requested resource cannot be found. |
| 405 | Method Not Allowed | The request method is not supported for the requested resource. |
| 500 | Internal Server Error | The server has encountered a generic error. |
| 502 | Bad Gateway | The server was acting as a gateway and received an invalid response. |
| 503 | Service Unavailable | The server is not ready to handle the request. |

#### 4. Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state:

- Sessions and Cookies:
    1.  When a user first visits a website, the server generates a unique session ID
    
    1.  The server sends this session ID to the browser in a ​set-cookie​ header
    
    1.  The browser stores this cookie containing the session ID
    
    1.  For all subsequent requests, the browser automatically includes this cookie in the request headers
    
    1.  The server uses the session ID to look up the associated session data

- AJAX:
    1. SImulate a stateful experience, as only parts of the html content can be updated with asyncronous javascript calls

    1. Ex: Google's autocomplete suggestions while typing into the searchbar

#### 5. Explain the difference between GET and POST, and know when to choose each:

- `GET`:
    1. A request from the client to the server to send a resource. Typically no body is sent, only headers.

    1. Use a `GET` request when trying to read data retrieved by the server, and no changes are meant to be made on the server

- `POST`:
    1. A request form the client to the server to send _(or write)_ data. Includes the data in the body of the request, in addition to any required Headers.

    1. Use a `POST` to write data to the server (ex: a review on a product), when changes are desired on or by the server

#### 6. Have a basic understanding of the asynchronous nature of AJAX, and the kinds of features that it enables for web apps:

- Asynchronous requests handled by callbacks that can update the DOM of a webpage without refreshing

- Provides a stateful experience with stateless HTTP, as only parts of the page that need to be changed are updated

- Increases loading performance, and provides a dynamic experience for the end user

- Features enabled by AJAX include:
   - Information popups on hover
   - Form validation without page reloads
   - Infinite scrolling content

<br>

## V. [Security](https://launchschool.com/lessons/74f1325b/assignments)

#### 1. Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks:

- HTTP is unencrypted by default. TLS is the primary mitigation for this

- Session Hijacking: Session Timers and forcing new logins after the same cookie is used with a differernt client

- XSS: Sanitize all user input is the main mitigation for this

- Same-Origin Policy: Enabling CORS and Same-Origin policies can help mitigate this

#### 2. Be aware of the different services that TLS can provide, and have a broad understanding of each of those services:

##### TLS Security:

- Encryption:
    1. Generates a symmetric key using asymmetric encryption
    1. Uses the generated key moving forward for efficient encrypted communication

- Digital Signatures:
    1.  The server creates a signature by encrypting specific data with its private key
    1.  The server sends this signature along with the original unencrypted data
    1.  The client decrypts the signature using the server's public key
    1.  If the decrypted signature matches the original data, it proves the sender possesses the private key

- Proving Authenticity of a Website via the chain-of-trust:
    1. CA determines how a party requesting a certificate will validate themselves
    1. CA signs the certificate of the website, and includes the unencrypted data
    1. The browser uses the CAs public key to decrypt the signature, and verify it matches the unencrypted content
    1. The Root CAs sidn the Intermediate CAs certificates, and also sign their own

- Integrity of Segments with MACs (Message Authentication Codes)
    1. The sender creates a digest of the plaintext message with the pre-agreed hash value using a hashing algorithm and sends this as the MAC
    1. The receiver uses the same hashing algorithm to check the decrypted message to see if it matches the MAC
    1. Since only the two parties protected by TLS know the pre-agreed hash value, this guarentees that the message has not been tampered with if the MAC matches
