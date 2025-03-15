**by devanand utkarsh**
# Enterprise JavaBeans (EJB)

## Overview
**firstly understand what is Beans and EJB ? this will help you to clear EJB.**

 Beans-
        Beans in General: Beans are objects or components in Java that help simplify programming by encapsulating data and behavior. They are designed to be reusable, so developers can use them multiple times across different parts of an application without having to rewrite code. This leads to easier maintenance and a more organized codebase.



Enterprise JavaBeans (EJB) are Java components that simplify the development of enterprise-level applications. They provide a way to encapsulate business logic, transaction management, security, and other services into reusable components, reducing development effort and maintaining a clean, organized codebase.

EJBs run inside an EJB container, which handles various aspects like transactions, security, and concurrency automatically.

## Features
1. **Transaction Management**: EJB supports automatic transaction management, ensuring that business methods are executed reliably and consistently.
2. **Security**: EJB provides built-in security features, including authentication, authorization, and role-based access control.
3. **Persistence**: EJB integrates seamlessly with Java Persistence API (JPA) to manage database operations and entity persistence.

    you can undertand In simple terms, persistence means saving data in such a way that it remains available after the program ends or the system is shut down, and can be retrieved when needed again.
    
            Example -
                    *Storing user information in a database so that when the user logs in again, their profile data, preferences, etc., are available.*

                    *Saving application settings on a disk so that when the user opens the application again, it remembers the settings.*

4. **Concurrency**: EJB provides built-in support for handling concurrent access to enterprise components, ensuring thread safety.

 (Concurrency ensures that Multiple tasks (threads or users) can run in parallel.)
    Example -
             Without proper concurrency control, both users might see the same initial balance, withdraw money, and then deposit it, leading to an incorrect balance.

             With proper concurrency mechanisms like transactions or locks, the system ensures that only one user can modify the balance at a time, maintaining the integrity of the data and preventing any corruption or inconsistency.

5. **Remote and Local Access**: EJB supports both local and remote client access, allowing components to be accessed from within the same application or over a network.

## Benefits
- **Simplifies Complex Tasks**: EJB simplifies critical tasks such as security, transaction management, and persistence.
- **Reusable Components**: EJB components can be reused across different parts of an application, reducing code duplication.
- **Scalable**: EJB can easily handle large numbers of users as your application grows.
- **Secure**: With built-in security features, EJB ensures secure application execution.

## Types of Enterprise JavaBeans

### 1. Session Beans
Session Beans are used to encapsulate business logic, and they are invoked by clients (remote or local). There are three main types:

#### Stateless Session Beans (SLSB)
- **No state is maintained** between method calls.
- Each method invocation is independent, and the bean instance can be reused across clients.
- Typically used for tasks that don't require client-specific state, such as basic business logic processing.

#### Stateful Session Beans (SFSB)
- **Maintains state** between method calls, specifically for a particular client session.
- The state is preserved across multiple method invocations for the same client.
- Useful for tasks that involve session-specific data, such as managing user preferences or shopping carts.

#### Singleton Session Beans
- A single instance of the bean is shared across all clients.
- Suitable for managing application-wide resources like caching, configuration settings, or resource management.

### 2. Message-Driven Beans (MDB)
- **Handles asynchronous messages** from JMS (Java Message Service) or other messaging systems.
- Processes messages in a decoupled manner and acts as listeners to messages sent to a JMS destination.
- Typically stateless and processes a single message per instance.

### 3. Entity Beans (Deprecated)
- **Entity beans** were used in earlier versions of EJB to represent persistent data and map it to database tables.
- They have been deprecated and replaced by the **Java Persistence API (JPA)** for managing persistence in modern applications.
- Entity Beans were classified into two types:
  - **Container-Managed Persistence (CMP)**: The container handles persistence logic.
  - **Bean-Managed Persistence (BMP)**: The bean itself manages persistence logic.

## Why Use EJB?
- **Transaction Management**: Ensures reliable, consistent business method executions.
- **Security**: Built-in authentication, authorization, and role-based access control.
- **Persistence**: Integrates with JPA to manage database operations.
- **Concurrency**: Provides mechanisms to handle concurrent access safely.
- **Scalability**: Built for handling large numbers of users and complex business logic.



more data and video will be added soon .... happly leaning :)
