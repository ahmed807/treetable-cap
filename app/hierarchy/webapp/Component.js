sap.ui.define(["sap/suite/ui/generic/template/lib/AppComponent"], (AppComponent) =>
  AppComponent.extend("hierarchy.Component", {
    metadata: {
      manifest: "json",
    },
  })
);
// Example of triggering navigation from Component.js or another global place
// var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
// oRouter.navTo("NodeDetails", { nodeID: selectedNodeID });
