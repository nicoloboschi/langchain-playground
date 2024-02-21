# Setup grafana dashboard from LangSmith's dataset

## (Optional) Export data from LangSmith 
Run the langsmith-export notebook to get a csv with your runs (replace the runs.csv file)

## Visualize grafana

```
cd grafana
docker-compose up
./setup-db.sh
```

Now open http://localhost:3000 (admin/admin) then add a new PostGre datasource (url is `http://postgres:5432`, db,user and password are `posgtres`).
Then import the dashboard from the dashboard.json file.
