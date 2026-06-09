# AI Chat Client

## Overview
This project is a cross-platform AI chat application built with Flutter. It provides an interface for interacting with various large language model APIs while introducing a non-linear conversation structure. Users can explore multiple outcomes of a single prompt by creating, visualizing, and managing divergent dialogue paths.

## Key Features
- Multi-API Support: Connects to standard chat completion endpoints, response APIs, and generative models.
- Context Management: Handles conversation history, text attachments, and image inputs.
- Configuration Profiles: Supports multiple API configurations and model selections.
- Local Persistence: Stores conversation history, settings, and file attachments locally on the device.
- Streaming Responses: Processes Server-Sent Events for real-time text and reasoning output.

## Focus: Branch Tree and Non-Linear Conversations
The core architecture of this application supports non-linear dialogue structures. Standard chat interfaces enforce a single sequence of messages. This application records every interaction as a node within a directed graph.

When a user requests a new response for an existing prompt or modifies a previous input, the system generates a new branch rather than altering the existing sequence. 

The Branch Tree interface is designed to manage this topology:
- Topological Visualization: Renders the complete structure of the session, mapping the exact parent-child relationships of every message and response.
- Context Switching: Permits users to select any node within the graph and set it as the active context for subsequent interactions.
- Node Inspection: Displays the user prompt, the AI response, and the generation status for every individual round directly on the canvas.
- Sub-tree Management: Provides controls to remove specific branches and all dependent child nodes to maintain a structured workspace.

This structure preserves all historical data and reasoning paths, allowing users to maintain multiple concurrent threads of inquiry within a single session.

## Technical Foundation
- Framework: Flutter
- State Management: Riverpod
- Database: Drift (SQLite)
- Networking: Native HTTP with custom Server-Sent Events parsing.