# IDDA-brew (`idw`)
Application boilerplate manager, only for me!

## Requirements
  - ruby 2.X

## Commands
```
idw describe TEMPLATE_NAME
```

For detail information of each commands, use:

```
idw help COMMAND
```

## Template specification
```json
{
  "name": "string",
  "description": "string",
  "dependencies": [
    "string"
  ],
  "make": [
    "string"
  ]
}
```

  - `name` : name of boilerplate
  - `description` : description of boilerplate (optional)
  - `dependencies` : list of dependencies
  - `make` : shell commands to make new project
