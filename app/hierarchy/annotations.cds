using HierarchyService from '../../srv/hierarchy-service';
using HierarchyService.NodeDetails as NodeDetails;

annotate HierarchyService.Node {
  nodeID @sap.hierarchy.node.for;
  hierarchyLevel @sap.hierarchy.level.for;
  parentNodeID @sap.hierarchy.parent.node.for;
  drillState @sap.hierarchy.drill.state.for;
  
}

annotate HierarchyService.Node with @(
  UI: {
    Identification: [
      { Value: objectName }
    ],
    SelectionFields: [ objectName ],
    LineItem: [
      { $Type: 'UI.DataField', Value: nodeID,     Label: 'Node ID' },
      { $Type: 'UI.DataField', Value: objectName, Label: 'Object Name' },
      { $Type: 'UI.DataField', Value: drillState, Label: 'Drill State' },
      { $Type: 'UI.DataFieldForAction', Action: 'NodeDetails', Label: 'Details' },
      {
            $Type : 'UI.DataFieldWithNavigationPath',
            Label : 'Details',
            Value : details.objectContent,
            Target : HierarchyService.NodeDetails
        }
      
      

    ],
    HeaderInfo: {
      $Type: 'UI.HeaderInfoType',
      TypeName: 'Node',
      TypeNamePlural: 'Nodes',
      Title: { Value: objectName },
      Description: { Value: objectName }
    }
  }
);



annotate HierarchyService.NodeDetails with @(
  UI: {
    Identification: [
      { Value: objectName },
      { Value: objectContent }
    ],
    LineItem: [
      { $Type: 'UI.DataField', Value: nodeID,        Label: 'Node ID' },
      { $Type: 'UI.DataField', Value: objectName,    Label: 'Object Name' },
      { $Type: 'UI.DataField', Value: objectContent, Label: 'Object Content' }
    ],
    HeaderInfo: {
      $Type: 'UI.HeaderInfoType',
      TypeName: 'Node Detail',
      TypeNamePlural: 'Node Details',
      Title: { Value: objectName },
      Description: { Value: objectContent }
    }
  }
);

