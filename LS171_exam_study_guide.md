# LS171 Exam Study Guide


## I. [The Internet](https://launchschool.com/lessons/4af196b9/assignments)

#### 1. Have a broad understanding of what the internet is and how it works:

- a network of networks

- example:
    > Computer -> Switch _(LAN)_ -> Router -> ... -> Router -> Switch _(LAN)_ -> Computer

#### 2. Understand the characteristics of the physical network, such as latency and bandwidth:

- bits _(1s and 0s)_ transported through a medium _(copper, fiber, radio, etc)_

- **latency**: a measure of the time it takes for some data to get from one point in a network to another point in a network, a measure of delay

- **bandwidth**: the amount of data that can be sent in a particular unit of time (typically, a second)

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

- 

#### 2. Be able to describe the HTTP request/response cycle:

- 

#### 3. Be able to explain what status codes are, and provide examples of different status code types:

- 

#### 4. Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state:

- 

#### 5. Explain the difference between GET and POST, and know when to choose each:

- 

#### 6. Have a basic understanding of the asynchronous nature of AJAX, and the kinds of features that it enables for web apps:

- 

<br>

## V. [Security](https://launchschool.com/lessons/74f1325b/assignments)

#### 1. Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks:

- 

#### 2. Be aware of the different services that TLS can provide, and have a broad understanding of each of those services:

- 
