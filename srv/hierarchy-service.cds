using test from '../db/data-model';

service HierarchyService {
  @readonly entity Node as projection on test.Node {
    nodeID,
    hierarchyLevel,
    parentNodeID,
    objectName,
    createdOn,
    createdBy,
    drillState,
    details // Expose the association to NodeDetails
  };

  @readonly entity NodeDetails as projection on test.NodeDetails {
    nodeID,
    objectName,
    objectContent
  };
}
