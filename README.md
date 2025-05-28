## Intro
In this project, we will create a database for a platform like Divaar where people put ads to sell items and others buy it.

## Documentation
- List of tables, normalized, at the end of [this file](https://docs.google.com/document/d/1IVtGYH52OOQg9mKn7xw89ou9vxhshHaPxQXWfxfh1UA/edit?tab=t.0).
- ER Diagram, [as SVG](https://www.mermaidchart.com/raw/84063802-5c17-4e64-a415-6ecef2cc315c?theme=light&version=v0.1&format=svg).

## How to set up environment?
- Clone by `git clone https://github.com/sananqsh/Panjere-DB.git`
- On terminal, change directory to the project path
- Run `cp .env.example .env`
- Install docker and run `docker-compose up -d`
- You now have a postgres container up and running
- You can add a data source on JetBrains IDEs with the credentials in specified on the `.env` file

## What to run?
- Run `create_commands/` DDL commands first.
- Run `insert_commands/` commands respective to their order
- Now, you can run `select_join_queries`
