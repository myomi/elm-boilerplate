declare module "*.elm" {
  var Elm: Elm;

  interface Elm {
    Main: ElmMain;
  }

  interface ElmMain {
    init(options: Options): ElmInstance;
  }

  interface Options {
    node: Element;
    flags?: any;
  }

  interface ElmInstance {
    ports: { [key: string]: ElmPort };
  }

  interface ElmPort {
    send(payload: any): void;
  }
}
