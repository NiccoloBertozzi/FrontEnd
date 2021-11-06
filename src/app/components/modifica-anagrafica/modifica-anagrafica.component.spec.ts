import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModificaAnagraficaComponent } from './modifica-anagrafica.component';

describe('ModificaAnagraficaComponent', () => {
  let component: ModificaAnagraficaComponent;
  let fixture: ComponentFixture<ModificaAnagraficaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModificaAnagraficaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModificaAnagraficaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
