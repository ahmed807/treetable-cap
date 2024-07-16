using project from '../../db/schema';
using {CatalogService} from '../../srv/cat-service';

service FioriService @(path: 'fiori') {
    entity Nodes as projection on CatalogService.Nodes

    @(UI: {
        PresentationVariant: {Visualizations: [{AnnotationPath: '@UI.'}]},
        LineItem           : [
            {
                Value: title,
                Label: 'Title'
            },
            {
                Value: group,
                Label: 'Group'
            }
        ],
        NetworkGraph       : {
            Nodes: {
                Key  : 'ID',
                Title: 'title',
                Group: 'group'
            },
            Edges: {
                From: 'fromNode_ID',
                To  : 'toNode_ID'
            }
        }
    })

    entity Edges as projection on CatalogService.Edges;
}
