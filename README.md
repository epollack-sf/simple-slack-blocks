# Simple Slack Blocks

Programmatically build Slack surface views using the Block Kit UI.

## Overview
- Have complex views that require control over which components are rendered? 
- Building a simple Apex Slack service that doesn't need the overhead of the Apex SDK for Slack?
- Prefer code over configuration?

Simple Slack Blocks is a pro-code SDK for Slack's Block UI that provides all the UI components, elements, and composites necessary for building dynamic and flexible views for your Slack surfaces. Each component and element is defined according to API specifications and has a corresponding builder for fluent creation. Once your view is composed, the entire structure can be serialized into JSON using [```JSON.serialize()```](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_System_Json.htm#unique_1535351403).
