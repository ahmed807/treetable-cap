namespace project;

using {
    managed,
    cuid
} from '@sap/cds/common';

entity Nodes : managed, cuid {
    key ID    : UUID;
        title : String;
        group : String;
}

entity Edges : managed, cuid {
    key ID       : UUID;
        fromNode : Association to Nodes;
        toNode   : Association to Nodes;
}
