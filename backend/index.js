// index.js
const express = require("express");
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();

//json
app.use(express.json());

//cors 
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-type');
    next();
})

//test api
app.get('/test', (req, res) => {
    try {
        res.status(200).json({ message: 'API is working' })
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
});

// Get all infos
app.get('/infos', async (req, res) => {
    try {
        const infos = await prisma.info.findMany();
        res.status(200).json(infos);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
})

// Get all stacks
app.get('/stacks', async (req, res) => {
    try {
        const stacks = await prisma.stack.findMany(); 
        res.status(200).json(stacks);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
})

// Get all projects
app.get('/projects', async (req, res) => {
    try {
        const projects = await prisma.project.findMany();
        res.status(200).json(projects);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
})

// Get all categories
app.get('/categories', async (req, res) => {
    try {
        const categories = await prisma.category.findMany();
        res.status(200).json(categories);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
})

// Get all contribuitor
app.get('/contributors', async (req, res) => {
    try {
        const contributors = await prisma.contributor.findMany();
        res.status(200).json(contributors);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
})

// Get all contacts
app.get('/contacts', async (req, res) => {
    try {
        const contacts = await prisma.contact.findMany();
        res.status(200).json(contacts);
    } catch (error) {
        res.status(500).json({ message: error.message })
    }
})

//start server
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`))
