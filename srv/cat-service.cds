using project from '../db/schema';

service CatalogService {
    entity Nodes as projection on project.Nodes;
    entity Edges as projection on project.Edges;
}
