namespace test;

entity Node {
  key nodeID: Integer;
  hierarchyLevel: Integer;
  parentNodeID: Integer;
  objectName: String;
  createdOn: String;
  createdBy: String;
  drillState: String;

  // Association to NodeDetails
  details: Association to NodeDetails on details.nodeID = nodeID;
}

entity NodeDetails {
  key nodeID: Integer;
  objectName: String;
  objectContent: String;
}

