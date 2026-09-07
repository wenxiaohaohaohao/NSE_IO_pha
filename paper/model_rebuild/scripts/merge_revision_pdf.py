from pathlib import Path
from pypdf import PdfReader,PdfWriter
from pypdf.generic import NameObject,DictionaryObject,ArrayObject
import json
m=Path('paper/manuscript');out=Path('output/pdf/mah_note_v11_revised_paper.pdf');w=PdfWriter();counts=[];sources=[];expected_links=0;expected_targets=[]
for stem,title in [('mah_route_indicator_friction_model','Main article'),('mah_route_indicator_friction_model_appendix','Technical appendix')]:
 r=PdfReader(m/(stem+'.pdf'));offset=len(w.pages);counts.append(len(r.pages));sources.append(r)
 w.append(r,outline_item=title,import_outline=True,excluded_fields=['/Annots'])
 page_map={p.indirect_reference.idnum:i for i,p in enumerate(r.pages)};named=r.named_destinations
 for i,p in enumerate(r.pages):
  for ref in p.get('/Annots',[]):
   old=ref.get_object();assert old.get('/Subtype')=='/Link';an=DictionaryObject()
   for key,val in old.items():
    if key not in ['/P','/A','/Dest']:an[NameObject(key)]=val.clone(w)
   act=old.get('/A');act=act.get_object() if act else None;dest=old.get('/Dest')
   if act and act.get('/S')=='/GoTo':dest=act['/D']
   if dest is not None:
    arr=named[dest].dest_array if isinstance(dest,str) else dest
    first=arr[0];idx=page_map[first.idnum] if hasattr(first,'idnum') else int(first)
    target=offset+idx;newdest=ArrayObject([w.pages[target].indirect_reference]+[x.clone(w) for x in arr[1:]])
    an[NameObject('/A')]=DictionaryObject({NameObject('/S'):NameObject('/GoTo'),NameObject('/D'):newdest});expected_targets.append((offset+i,target))
   elif act:an[NameObject('/A')]=act.clone(w)
   an[NameObject('/P')]=w.pages[offset+i].indirect_reference
   page=w.pages[offset+i]
   if '/Annots' not in page:page[NameObject('/Annots')]=ArrayObject()
   page['/Annots'].append(w._add_object(an));expected_links+=1
w.set_page_label(0,counts[0]-1,style='/D',start=1);w.set_page_label(counts[0],sum(counts)-1,style='/D',prefix='A-',start=1)
w.add_metadata({'/Title':"Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform",'/Subject':'Revised main article and technical appendix; execution note + amendment v1.1','/Creator':'LaTeX; verified model rebuild, September 7, 2026'})
w.write(out);r=PdfReader(out);assert len(r.pages)==49 and r.page_labels[12]=='A-1'
actual_links=sum(len(p.get('/Annots',[])) for p in r.pages);assert actual_links==expected_links
page_map={p.indirect_reference.idnum:i for i,p in enumerate(r.pages)};actual=[]
for i,p in enumerate(r.pages):
 for ref in p.get('/Annots',[]):
  act=ref.get_object().get('/A')
  if act and act.get('/S')=='/GoTo':actual.append((i,page_map[act['/D'][0].idnum]))
assert actual==expected_targets
idx=0
for source in sources:
 for p in source.pages:assert r.pages[idx].extract_text()==p.extract_text();idx+=1
Path('paper/model_rebuild/revision_20260907/audit/phase18_merged_pdf_validation.json').write_text(json.dumps({'pages':49,'main':12,'appendix':37,'all_page_text_preserved':True,'annotations_preserved':actual_links,'internal_targets_verified':len(actual),'page_labels_verified':True,'bookmarks_imported':True},indent=2))
print('49 pages; all text and',actual_links,'links preserved;',len(actual),'internal targets verified.')
