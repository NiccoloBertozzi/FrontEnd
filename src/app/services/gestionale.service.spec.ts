import { TestBed } from '@angular/core/testing';

import { GestionaleService } from './gestionale.service';

describe('GestionaleService', () => {
  let service: GestionaleService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(GestionaleService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
