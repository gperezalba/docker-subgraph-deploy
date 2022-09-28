```bash
docker build -t subgraph-deploy --build-arg USER=gperezalba --build-arg PAT=<PAT> --build-arg ORG=Tutellus --build-arg NAME=tutellus-subgraph --build-arg GRAPH_NODE=http://localhost:8020 --build-arg IPFS=http://localhost:5001 .
```