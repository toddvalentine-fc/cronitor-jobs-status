# github-action-cronitor-task-check

cancels a deployment if any jobs associated with cronitor_key are running.

### requirements
- `CRONITOR_KEY`: saved to Github Secrets as `CRONITOR_KEY`

### example workflow
```
name: Deploy
on:
  push:
    branches: 
      - develop
jobs:           
  deployment:
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop'
    steps:
      - uses: actions/checkout@v2
      
      - uses: toddvalentine-fc/cronitor-task-status@v1
        with:
          CRONITOR_KEY: ${{ secrets.CRONITOR_KEY }}
```


