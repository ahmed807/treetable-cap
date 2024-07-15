using HierarchyService from '../../srv/hierarchy-service';
using HierarchyService.NodeDetails as NodeDetails;

annotate HierarchyService.Node {
  nodeID         @sap.hierarchy.node.for;
  hierarchyLevel @sap.hierarchy.level.for;
  parentNodeID   @sap.hierarchy.parent.node.for;
  drillState     @sap.hierarchy.drill.state.for;

}

annotate HierarchyService.Node with @(UI: {
  Identification        : [
    {Value: nodeID},
    {Value: objectName},
    {
      Value: parentNodeID,
      Label: 'Parent Node ID'
    }
  ],
  SelectionFields       : [
    objectName,
    details.objectContent
  ],
  LineItem              : [
    {
      $Type: 'UI.DataField',
      Value: nodeID,
      Label: 'Node ID'
    },
    {
      $Type: 'UI.DataField',
      Value: objectName,
      Label: 'Object Name'
    },
    {
      $Type: 'UI.DataField',
      Value: drillState,
      Label: 'Drill State'
    },
  ],
  HeaderInfo            : {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Node',
    TypeNamePlural: 'Nodes',
    Title         : {Value: objectName}
  },
  Facets                : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{@i18n>@GeneralInfoFacetLabel}',
    Target: '@UI.FieldGroup#Details',
  }, ],
  FieldGroup #NavExample: {Data: [{
    $Type : 'UI.DataFieldWithNavigationPath',
    Label : 'Node Details',
    Value : details.objectName,
    Target: 'details'
  }]},
  FieldGroup #Details   : {
    $Type: 'UI.FieldGroupType',
    Label: 'Dimensions',
    Data : [
      {
        $Type: 'UI.DataField',
        Value: details.nodeID
      },
      {
        $Type: 'UI.DataField',
        Value: details.objectName
      },
      {
        $Type: 'UI.DataField',
        Value: details.objectContent
      }
    ]
  },

}


);


annotate HierarchyService.NodeDetails with @(UI: {
  Identification: [
    {Value: objectName},
    {Value: objectContent}
  ],
  LineItem      : [
    {
      $Type: 'UI.DataField',
      Value: nodeID,
      Label: 'Node ID'
    },
    {
      $Type: 'UI.DataField',
      Value: objectName,
      Label: 'Object Name'
    },
    {
      $Type: 'UI.DataField',
      Value: objectContent,
      Label: 'Object Content'
    }
  ],
  HeaderInfo    : {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Node Detail',
    TypeNamePlural: 'Node Details',
    Title         : {Value: nodeID},
    Description   : {Value: objectContent}
  }
});
